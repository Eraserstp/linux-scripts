#!/bin/bash
cd /usr/share/i18n/locales/
cp ru_RU ru_RU_sorted
cp iso14651_t1 iso14651_t1_sorted
cp iso14651_t1_common iso14651_t1_common_sorted
sed -i 's/copy "iso14651_t1"/copy "iso14651_t1_sorted"/g' ru_RU_sorted
sed -i 's/copy "iso14651_t1_common"/copy "iso14651_t1_common_sorted"/g' iso14651_t1_sorted
sed -i 's/<U005F> IGNORE;/<U005F> <RES-1>;/g' iso14651_t1_common_sorted
grep -q '^ru_RU_sorted' /etc/locale.gen || echo 'ru_RU_sorted.UTF-8 UTF-8' >> /etc/locale.gen
/usr/sbin/locale-gen
/usr/sbin/validlocale ru_RU_sorted.UTF-8
localectl set-locale LANG=ru_RU_sorted.utf8
read -n 1 -s -r -p "Press any key to exit. Reboot to enable locale."
