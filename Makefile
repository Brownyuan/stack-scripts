BMDIR = $(PWD)/buildin_modules
MDIR = $(PWD)/.modules
BINDIR = $(PWD)/.bin
CBINDIR = $(PWD)/cbin

BUILDIN_SH = $(addprefix $(BINDIR)/, $(addsuffix .sh, $(shell ls $(BMDIR))))

MANAGER_M = $(addprefix $(BINDIR)/, basic.sh swarm_manager.sh download_conf_m.sh sskcp_server_deploy.sh dns_proxy.sh)

WORKER_M = $(addprefix $(BINDIR)/, basic.sh swarm_worker.sh download_conf_w.sh dns_proxy.sh)

.PHONY: create-env create-manager-sh clean init-m asm-m del-m

# Generate manager.sh and worker.sh
create-env: clean $(BMDIR)
	mkdir $(MDIR) $(BINDIR) $(CBINDIR)
	cp -rf $(BMDIR)/* $(MDIR)

$(BUILDIN_SH): $(BINDIR)/%.sh: $(MDIR)/%
	cat $</header $</config $</code > $@

create-manager-sh: $(BUILDIN_SH)
	cat shebang $(MANAGER_M) > $(CBINDIR)/manager.sh 
	rm -rf $(MDIR) $(BINDIR)

create-worker-sh: $(BUILDIN_SH)
	cat shebang $(WORKER_M) > $(CBINDIR)/worker.sh 
	rm -rf $(MDIR) $(BINDIR)

clean:
	rm -rf $(MDIR) $(BINDIR) $(CBINDIR)


# Manipulate individule module
init-m: $(MDIR)
	mkdir $(MDIR)/$(NAME)
	touch $(MDIR)/$(NAME)/config
	touch $(MDIR)/$(NAME)/code
	touch $(MDIR)/$(NAME)/header

asm-m: $(MDIR) $(BINDIR)
	cd $(MDIR)/$(NAME) && cat header config code > $(BINDIR)/$(NAME).sh

del-m: $(MDIR) 
	rm -rf $(MDIR)/$(NAME)
	rm $(BINDIR)/$(NAME).sh


