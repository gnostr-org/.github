gnostr-act:##
	@touch ~/GITHUB_TOKEN.txt
	@export $(cat ~/GITHUB_TOKEN.txt) && act -C $(PWD) -vbr -W $(PWD)/.github/workflows/$@.yml
gnostr-static:##
	@touch ~/GITHUB_TOKEN.txt
	@export $(cat ~/GITHUB_TOKEN.txt) && act -C $(PWD) -vbr -W $(PWD)/.github/workflows/$@.yml
.PHONY:gnostr-docker-git-server
gnostr-docker-build-git:docker-start
	@docker build -f git.dockerfile --tag gnostr.org:latest --no-cache
gnostr-docker-git-server:docker-start
	@docker run --detach \
    --name gnostr.org.$(WEEBLE).$(WOBBLE).$(BLOCKHEIGHT) \
    --volume $(HOME):/home/$(shell whoami) \
    --volume $(PWD):/srv/git \
    --env GIT_PASSWORD=$(APP_KEY) \
    --publish 2222:22 \
    --publish 6012:6102 \
    --publish 443:443 \
    gnostr.org:latest

# vim: set noexpandtab:
# vim: set setfiletype make
