require 'roo'

xlsx = Roo::Spreadsheet.open('./global.xlsx')

1.upto(2935) do |e|
    a = Classroom.new
    a.class_day = xlsx.sheet('Sheet1').row(e)[0]
    a.class_begin = xlsx.sheet('Sheet1').row(e)[1]
    a.class_end = xlsx.sheet('Sheet1').row(e)[2]
    a.class_room = xlsx.sheet('Sheet1').row(e)[3]
    a.class_campus = "global"
    a.save
end