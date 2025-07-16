## DiskUsage - Disk Usage

```
Description: Summarize disk usage recursively for the given directory.
Usage      : diskusage [Options] [Directory]
Options    :
    /a, /systemFile[:N]      displays size for system files (and optionally the top N system
                             files by SizeOnDisk in descending order)
    /b, /reserved            displays size for reserved space
    /c, /csv                 displays in csv format
    /d, /maxDepth:N          displays directory information only if it is N or
                             fewer levels below command line argument
    /e, /minFileSize:SIZE    displays directory information only if its FileSize
                             is greater or equal than SIZE
    /f, /minSizeOnDisk:SIZE  displays directory information only if its SizeOnDisk
                             is greater or equal than SIZE
    /g, /displayFlag:FLAG    specifies the flags value to determin which column(s) to display
                             column          value    description
                             SizeOnDisk      0x001    the on disk size
                             FileSize        0x002    the end of file size
                             SizePerDir      0x004    sum of SizeOnDisk for top level child
                             Files           0x008    number of child files
                             ChildDirs       0x010    number of child directories
                             FilesPerDir     0x020    number of top level child files
                             DirsPerDir      0x040    number of top level child directories
                             CreationTime    0x080    file creation timestamp
                             LastAccessTime  0x100    file last access timestamp
                             LastWriteTime   0x200    file last write timestamp
                             Attributes      0x400    file attributes
    /h, /humanReadable       displays size in human readable format
    /i, /iniFile:FILE        takes all the parameters from an INI file.
                             NOTE: SCENARIO name must be speificed via /j (/scenario)
    /j, /secnario:SCENARIO   specifies the scenario name for the INI file
    /k, /reparse             recurse into reparse directories
    /l, /allLinks            count all hardlinks separately (By default, files with multiple
                             hardlinks are counted only once towards the first link name in
                             alphabetical order)
    /m, /multipleName        count only files with more than one link names
    /n, /nameFilter:FILTER   count only files whose name matches the name filter
    /p, /preferredPath:PATH  count files with multiple link names towards the first link in
                             alphabetical order that's under PATH if it exists.
                             To query with multiple preferred paths, separate with comma \",\",
                             e.g. /p:D:\path1,D:\path2)
                             NOTE: This options must not be specified togerther
                             with /l (/allLinks)
    /q, /virtual             recurse into virtual directories
    /s, /skipRecurse         skip recursing into child directories when calculating sizes
    /t, /TopDirectory:N      displays Top N directories by SizeOnDisk in descending order
    /u, /TopFile:N           displays Top N files by SizeOnDisk in descending order
    /v, /verbose             displays verbose error information
    /x, /clearDefault        do not display the default selected columns
```
