#ifndef SOUPFS_FSCORE_SUPERBLOCK_H
#define SOUPFS_FSCORE_SUPERBLOCK_H

#include "common.h"

typedef struct {
	uint32_t fs_size; // in blocks
	uint32_t block_size; // in bytes

	uint32_t free_block_count;
	uint32_t free_inode_count;

	block_number_t inode_table;
	uint32_t max_filesize; // in bytes
	uint32_t magic_number;
} disk_superblock_t;

typedef struct {
	disk_superblock_t disk_superblock;

	bitmap_t *block_bitmap;
	bitmap_t *inode_bitmap;
	bool dirty;
} superblock_t;

#endif // SOUPFS_FSCORE_SUPERBLOCK_H

