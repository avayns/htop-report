```

                           
#    # #####  ####  #####  
#    #   #   #    # #    # 
######   #   #    # #    # 
#    #   #   #    # #####  
#    #   #   #    # #      
#    #   #    ####  #      
                           


```
**Package:** htop  
**Version:** 3.4.1-5  
**Priority:** optional  
**Section:** utils  
**Maintainer:** Daniel Lange <DLange@debian.org>  
**Installed-Size:** 434 kB  
**Depends:** libc6 (>= 2.38), libncursesw6 (>= 6), libtinfo6 (>= 6)  
**Suggests:** lm-sensors, lsof, strace  
**Homepage:** https://htop.dev/  
**Tag:** admin::monitoring, implemented-in::c, interface::text-mode,  
 role::program, scope::utility, uitoolkit::ncurses, use::monitor,  
 works-with::software:running  
**Download-Size:** 171 kB  
**APT-Sources:** http://deb.debian.org/debian trixie/main amd64 Packages  
**Description:** интерактивный просмотрщик процессов  
 Htop — программа для просмотра процессов, основанная на ncurses и схожая с top, но позволяющая прокручивать список по вертикали и горизонтали для  
 отображения всех процессов и их командных строк запуска.  
 .  
 Управление процессами (остановка, изменение приоритета) может выполняться  
 без ручного ввода их идентификаторов.  
  

## Структура пакета

```
.
└── usr
    ├── bin
    │   └── htop
    └── share
        ├── applications
        │   └── htop.desktop
        ├── doc
        │   └── htop
        │       ├── AUTHORS
        │       ├── changelog.Debian.gz
        │       ├── changelog.gz
        │       ├── copyright
        │       └── README.md.gz
        ├── icons
        │   └── hicolor
        │       └── scalable
        │           └── apps
        │               └── htop.svg
        ├── man
        │   └── man1
        │       └── htop.1.gz
        └── pixmaps
            └── htop.png

14 directories, 10 files
```

## Файл preinst

_В пакете нет файла preinst_

## Файл postinst

_В пакете нет файла postinst_

## Файл prerm

_В пакете нет файла prerm_

## Файл postrm

_В пакете нет файла postrm_

