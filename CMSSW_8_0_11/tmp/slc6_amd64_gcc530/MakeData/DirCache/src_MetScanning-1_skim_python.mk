ifeq ($(strip $(PyMetScanning-1skim)),)
PyMetScanning-1skim := self/src/MetScanning-1/skim/python
src_MetScanning-1_skim_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/MetScanning-1/skim/python)
PyMetScanning-1skim_files := $(patsubst src/MetScanning-1/skim/python/%,%,$(wildcard $(foreach dir,src/MetScanning-1/skim/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyMetScanning-1skim_LOC_USE := self  
PyMetScanning-1skim_PACKAGE := self/src/MetScanning-1/skim/python
ALL_PRODS += PyMetScanning-1skim
PyMetScanning-1skim_INIT_FUNC        += $$(eval $$(call PythonProduct,PyMetScanning-1skim,src/MetScanning-1/skim/python,src_MetScanning-1_skim_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyMetScanning-1skim,src/MetScanning-1/skim/python))
endif
ALL_COMMONRULES += src_MetScanning-1_skim_python
src_MetScanning-1_skim_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MetScanning-1_skim_python,src/MetScanning-1/skim/python,PYTHON))
