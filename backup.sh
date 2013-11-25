#! /bin/bash
read -p "Please enter an email: " email

tar -cf "home`/bin/date +%Y%m%d`".tar.gz ~
uuencode "home`/bin/date +%Y%m%d`.tar.gz" unixdirectory | mailx -s "Unix Directory for `/bin/date +%Y%m%d`" $email
rm "home`/bin/date +%Y%m%d`.tar.gz"