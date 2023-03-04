SRC_DIR=./proto
DST_DIR=./lib/models/grpc

protoc -I=$SRC_DIR/include --dart_out=grpc:$DST_DIR $SRC_DIR/include/google/protobuf/timestamp.proto
# protoc -I=$SRC_DIR/include --dart_out=grpc:$DST_DIR $SRC_DIR/include/google/protobuf/timeofday.proto
protoc -I=$SRC_DIR --dart_out=grpc:$DST_DIR $SRC_DIR/**.proto 