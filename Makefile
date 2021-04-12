MAKEFILE_PATH:=$(abspath $(lastword $(MAKEFILE_LIST)))  #获取当前正在执行的makefile的绝对路径
BUILD_ROOT:= $(shell dirname $(MAKEFILE_PATH))

API_DIR := $(BUILD_ROOT)/api
PROTO_FILE := $(API_DIR)/testp.proto

all: proto
	@echo "=====OK====="

proto: $(PROTO_FILE)
	protoc -I$(API_DIR) \
	--go_out=$(API_DIR) --go_opt=paths=source_relative \
	--go-grpc_out=$(API_DIR) --go-grpc_opt=paths=source_relative \
	$(PROTO_FILE)


.PHONY: all proto