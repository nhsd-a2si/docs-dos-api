reserve:
	rm -rf _site
	bundle exec jekyll build
	bundle exec jekyll serve --incremental

clean:
	rm -rf _site

install:
	bundle exec install
