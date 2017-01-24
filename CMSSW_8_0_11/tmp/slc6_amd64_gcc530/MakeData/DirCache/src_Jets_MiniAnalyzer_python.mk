ifeq ($(strip $(PyJetsMiniAnalyzer)),)
PyJetsMiniAnalyzer := self/src/Jets/MiniAnalyzer/python
src_Jets_MiniAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Jets/MiniAnalyzer/python)
PyJetsMiniAnalyzer_files := $(patsubst src/Jets/MiniAnalyzer/python/%,%,$(wildcard $(foreach dir,src/Jets/MiniAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyJetsMiniAnalyzer_LOC_USE := self  
PyJetsMiniAnalyzer_PACKAGE := self/src/Jets/MiniAnalyzer/python
ALL_PRODS += PyJetsMiniAnalyzer
PyJetsMiniAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyJetsMiniAnalyzer,src/Jets/MiniAnalyzer/python,src_Jets_MiniAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyJetsMiniAnalyzer,src/Jets/MiniAnalyzer/python))
endif
ALL_COMMONRULES += src_Jets_MiniAnalyzer_python
src_Jets_MiniAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Jets_MiniAnalyzer_python,src/Jets/MiniAnalyzer/python,PYTHON))
