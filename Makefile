PROJ_DIR = $(shell pwd)
SRC_DIR = $(PROJ_DIR)/src
OBJ_DIR = $(PROJ_DIR)/obj
INC_DIR = $(PROJ_DIR)/include
TMP_DIR = $(PROJ_DIR)/tmp
BIN_DIR = $(PROJ_DIR)/bin
HEADERS = $(INC_DIR)/func1.h $(INC_DIR)/func2.h

OBJ_FILES = $(OBJ_DIR)/func1.o $(OBJ_DIR)/func2.o $(OBJ_DIR)/main.o

$(BIN_DIR)/myapp: $(OBJ_FILES)
	gcc -o $@ $^

$(OBJ_DIR)/main.o: $(SRC_DIR)/main.c $(HEADERS)
	gcc -c $< -o $@ -I$(INC_DIR)

$(OBJ_DIR)/func1.o: $(SRC_DIR)/func1.c $(HEADERS)
	gcc -c $< -o $@ -I$(INC_DIR)

$(OBJ_DIR)/func2.o: $(SRC_DIR)/func2.c $(HEADERS)
	gcc -c $< -o $@ -I$(INC_DIR)

clean:
	rm $(BIN_DIR)/myapp $(OBJ_DIR)/*.o

