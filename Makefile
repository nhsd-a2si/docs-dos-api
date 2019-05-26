reserve:
	rm -rf _site
	bundle exec jekyll build
	bundle exec jekyll serve --incremental

clean:
	rm -rf _site

install:
	bundle exec install

builddocker:
	export JEKYLL_VERSION=3.8
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	--volume="$(PWD)/vendor/bundle:/usr/local/bundle" \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll build

servedocker:
	export JEKYLL_VERSION=3.8
	docker run --rm \
	--volume="$(PWD):/srv/jekyll" \
	--volume="$(PWD)/vendor/bundle:/usr/local/bundle" \
	-p 4005:4005 \
	-it jekyll/jekyll:$(JEKYLL_VERSION) \
	jekyll serve
