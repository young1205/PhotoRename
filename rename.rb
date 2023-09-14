longString = 'photo.jpg, Krakow, 2013-09-05 14:08:15 
Mike.png, London, 2015-06-20 15:13:22 
myFriends.png, Krakow, 2013-09-05 14:07:13 
Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02 
pisatower.jpg, Florianopolis, 2015-07-22 23:59:59 
BOB.jpg, London, 2015-08-05 00:02:03 
notredame.png, Florianopolis, 2015-09-01 12:00:00 
me.jpg, Krakow, 2013-09-06 15:40:22 
a.png, Krakow, 2016-02-13 13:33:50 
b.jpg, Krakow, 2016-01-02 15:12:22 
c.jpg, Krakow, 2016-01-02 14:34:30 
d.jpg, Krakow, 2016-01-02 15:15:01 
e.png, Krakow, 2016-01-02 09:49:09 
f.png, Krakow, 2016-01-02 10:55:32
g.jpg, Krakow, 2016-02-29 22:13:11'



def solution(s) 
    Photo = Struct.new(:id, :city, :time, :extension, :numberCity)

    count = 0
    photoArray = []

    # Run through each line once splitting into appropriate values
    s.split(/\r?\n|\r/).each { |line|
    testLine = line.split(",",3) 
    photoEnd = testLine[0].split(".",2)
    singlePhoto = Photo.new count, testLine[1], testLine[2], photoEnd[1], "" 
    photoArray = photoArray.append(singlePhoto)
    count += 1
    }

    # Sort photos by city then time
    sorted_photos = photoArray.sort_by{ |photo| [photo[:city], photo[:time]] }
    
    # The following code runs through each value and gets the count to add to the name
    currentCity=""
    totalCount = 0
    for i in sorted_photos do    
        if i.city != currentCity 
          cityCount = 0
          currentCity = i.city
        end
        cityCount += 1
        i.numberCity = cityCount.to_s
        
        # Prepend 0 if count reaches 10
        if cityCount == 10
           x = 1
           while x < 10
              sorted_photos[totalCount-x].numberCity = "0"+sorted_photos[totalCount-x].numberCity
              x += 1
            end
       end

       # Prepend 0 if count reaches 100
       if cityCount == 100
          x = 1
          while x < 100
           sorted_photos[totalCount-x].numberCity = "0"+sorted_photos[totalCount-x].numberCity
           x += 1
          end
        end
       totalCount+=1
    end

    # Arrange photos in initial order and print new name
    sorted_photos = photoArray.sort_by{ |photo| photo[:id] }
    for i in sorted_photos do    
       puts i.city  + i.numberCity + "." + i.extension
    end
end 

solution(longString)