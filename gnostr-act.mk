gnostr-act:##
	@touch ~/GITHUB_TOKEN.txt
	@export $(cat ~/GITHUB_TOKEN.txt) && act -C $(PWD) -vbr -W $(PWD)/.github/workflows/$@.yml
gnostr-static:##
	@touch ~/GITHUB_TOKEN.txt
	@export $(cat ~/GITHUB_TOKEN.txt) && act -C $(PWD) -vbr -W $(PWD)/.github/workflows/$@.yml
gnostr-docker-git-server:docker-start
	@docker build . --tag gnostr.org:latest --no-cache
	@docker run --detach \
  --name gnostr.org \
  --volume $(HOME):/home/$(shell whoami) \
  --volume $(PWD):/srv/git \
  --env GIT_PASSWORD=$(APP_KEY) \
  --publish 2222:22 \
  gnostr.org:latest

# vim: set noexpandtab:
# vim: set setfiletype make
