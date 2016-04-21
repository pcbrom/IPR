getwd()
setwd()

# instalar o rdrop2
install.packages(c("rdrop2", "dplyr"), dependencies = T)

# carregar os pacotes
require(rdrop2); require(dplyr)

# Retrieve Dropbox account information
drop_acc() %>% select(uid, display_name, email_verified, quota_info.quota)

# Dropbox directory listing
drop_dir()

# or specify a path
drop_dir("PASTA DE INTERESSE")

# Filter directory listing by filetype (e.g. png files)
drop_dir() %>% filter(mime_type == "png")

# Create folders on Dropbox
drop_create('drop_test')

# or provide the full path where it needs to be created
drop_create('public/drop_test')


# Upload a file into Dropbox
# csv files
write.csv(mtcars, 'mtcars.csv')
# upload to a specific folder
drop_upload('mtcars.csv', dest = "drop_test")

# Download a file
drop_get('mtcars.csv')

# or add path if file is not in root
drop_get("drop_test/mtcars.csv")

# Delete a file
drop_delete('drop_test/mtcars.csv')

# Move files
drop_create("new_folder")
drop_move("mtcars.csv", "new_folder/mtcars.csv")

# Copy files
drop_create("new_folder2")
drop_copy("new_folder/mtcars.csv", "new_folder2/mtcars.csv")

# Search your Dropbox
x = drop_search('NOME_ARQUIVO')
dim(x)
head(x)
tail(x)

# Share links
mp3 = drop_search("ARQUIVO.mp3")
drop_share(mp3$path)

# Read csv files directly from Dropbox
dados = drop_read_csv("ENDERECO")
