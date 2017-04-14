require 'roo'

xlsx = Roo::Spreadsheet.open('./seoul.xlsx')

1.upto(2747) do |e|
    a = Classroom.new
    a.class_day = xlsx.sheet('Sheet1').row(e)[0]
    a.class_begin = xlsx.sheet('Sheet1').row(e)[1]
    a.class_end = xlsx.sheet('Sheet1').row(e)[2]
    a.class_room = xlsx.sheet('Sheet1').row(e)[3]
    a.class_campus = "seoul"
    a.save
end