PROJ_DIR=$(shell pwd)
SRC_DIR=$(PROJ_DIR)/src
INC_DIR=$(PROJ_DIR)/include
OBJ_DIR=$(PROJ_DIR)/obj
BIN_DIR=$(PROJ_DIR)/bin

# 명시적으로 오브젝트 파일 목록을 지정
OBJ_FILES=$(OBJ_DIR)/main.o $(OBJ_DIR)/func1.o $(OBJ_DIR)/func2.o

# 실행 파일 생성 규칙
$(BIN_DIR)/myapp: $(OBJ_FILES)
	gcc -o $@ $^

# 개별 소스 파일을 컴파일하여 오브젝트 파일 생성
$(OBJ_DIR)/main.o: $(SRC_DIR)/main.c
	gcc -o $@ -c $< -I$(INC_DIR)

$(OBJ_DIR)/func1.o: $(SRC_DIR)/func1.c
	gcc -o $@ -c $< -I$(INC_DIR)

$(OBJ_DIR)/func2.o: $(SRC_DIR)/func2.c
	gcc -o $@ -c $< -I$(INC_DIR)

# 클린 규칙
clean:
	rm -rf $(OBJ_DIR)/*.o
	rm -rf $(BIN_DIR)/myapp


