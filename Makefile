# https://github.com/ggerganov/whisper.cpp
WHISPER_REPO_NAME=whisper.cpp
WHISPER_REPO=https://github.com/ggerganov/whisper.cpp
# https://github.com/ggerganov/whisper.cpp/releases/tag/v1.7.1
WHISPER_REPO_VERSION=v1.7.1

print:
	@echo ""
	@echo "- dep"
	@echo "WHISPER_REPO_NAME:      $(WHISPER_REPO_NAME)"
	@echo "WHISPER_REPO:           $(WHISPER_REPO)"
	@echo "WHISPER_REPO_VERSION:   $(WHISPER_REPO_VERSION)"
	@echo ""

dep-del:
	rm -rf $(WHISPER_REPO_NAME)
dep: dep-del
	git clone $(WHISPER_REPO) -b $(WHISPER_REPO_VERSION)
	@echo $(WHISPER_REPO_NAME) >> .gitignore

	# https://github.com/ggerganov/whisper.cpp?tab=readme-ov-file#quick-start

	# Then, download one of the Whisper models converted in ggml format. For example:
	cd $(WHISPER_REPO_NAME) && sh ./models/download-ggml-model.sh base.en

	# Then, build..
	cd $(WHISPER_REPO_NAME) && $(MAKE)
dep-test:
	# transcribe an audio file
	# If it works, you will see the text from the audio file.
	cd $(WHISPER_REPO_NAME) && ./main -f samples/jfk.wav

bin:
	go build .


	

