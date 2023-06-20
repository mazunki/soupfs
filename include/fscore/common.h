#ifndef SOUPFS_FSCORE_COMMON_H
#define SOUPFS_FSCORE_COMMON_H

#include "fscore/inode.h"

typedef const char* path_t;
typedef const char* tag_t;

typedef struct {
} datablock_t;

typedef struct {
	inode_t inode;
	tag_t tagname;
} dir_entry_t;

typedef struct {
} file_descriptor_t;

typedef struct {
} file_system_t;

 
#endif // SOUPFS_FSCORE_COMMON_H

