gnostr-org-matrix:##
	@touch ~/GITHUB_TOKEN.txt
	@export $(cat ~/GITHUB_TOKEN.txt) && act -C $(PWD) -vbr -W $(PWD)/.github/workflows/$@.yml
gnostr-static:##
	@touch ~/GITHUB_TOKEN.txt
	@export $(cat ~/GITHUB_TOKEN.txt) && act -C $(PWD) -vbr -W $(PWD)/.github/workflows/$@.yml

# vim: set noexpandtab:
# vim: set setfiletype make
