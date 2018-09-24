BMDIR = $(PWD)/buildin_modules
MDIR = $(PWD)/.modules
BINDIR = $(PWD)/bin
CBINDIR = $(PWD)/cbin

BUILDIN_SH = $(addprefix $(BINDIR)/, $(addsuffix .sh, $(shell ls $(BMDIR))))

MANAGER_M = $(addprefix $(BINDIR)/, basic.sh download_conf_m.sh	swarm_manager.sh sskcp_server_deploy.sh dns_proxy.sh)
WORKER_M = $(addprefix $(BINDIR)/, basic.sh download_conf_w.sh swarm_worker.sh dns_proxy.sh)

.PHONY: init clean init-m asm-m del-m create-sh

create-env: $(BMDIR)
	mkdir $(MDIR) $(BINDIR) $(CBINDIR)
	cp -rf $(BMDIR)/* $(MDIR)

$(BUILDIN_SH): $(BINDIR)/%.sh: $(MDIR)/%
	cat $</header $</config $</code > $@

init: create-env $(BUILDIN_SH)

create-sh: init $(CBINDIR) shebang
	cat shebang $(MANAGER_M) > $(CBINDIR)/manager.sh 
	cat shebang $(WORKER_M) > $(CBINDIR)/worker.sh 

clean: $(MDIR) $(BINDIR)
	rm -rf $(MDIR) $(BINDIR) $(CBINDIR)

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


