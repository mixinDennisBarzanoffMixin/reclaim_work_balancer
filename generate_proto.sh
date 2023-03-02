SRC_DIR=./proto
DST_DIR=./lib/models/grpc

protoc -I=$SRC_DIR --dart_out=grpc:$DST_DIR $SRC_DIR/**.proto 