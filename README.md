### VK music scrapper ###

This scrapper get music title and artist name, write in file for migrate to another music service.

If you have many adios change the value in `data_scrapper.rb` to bigger value:
```
def scroll_down_page
 20.times do # change 20 to your value e.g. 100
   @session.execute_script(SCROLL_SCRIPT)
   sleep(2)
 end
 sleep(2)
end
```
Rename `data.yml.example` to `data.yml` and paste your creds.

Run: `bundle` and then `ruby script.rb`

Then, go to [Yandex.Music](https://music.yandex.com/import) (e.g. for yandex), and drop created txt file.
