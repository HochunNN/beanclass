class HomeController < ApplicationController
  
  def index
    
    
  end
  
  def result
    
    time_begin_wanted = Time.parse("1970-01-01 #{params[:begin]}").to_i
    time_end_wanted = Time.parse("1970-01-01 #{params[:end]}").to_i
    if time_begin_wanted >= time_end_wanted
        
      redirect_to "/home/index" 
      flash[:alert] = "동무 시작시는 끝시보다 빨라야 하오"
    
    else
      
      classroom_campus_filter = Classroom.where(class_campus: params[:campus])
      classroom_building_filter = classroom_campus_filter.where("class_room LIKE ?", "%#{params[:building]}%")
      classroom_day_filtered = classroom_building_filter.where(class_day: params[:day])
      
      
      # 교실 사용 불가능 한 곳들 3가지 경우
      # 1. 수업의 시작시가 원하는 시간보다 더 빠르지만 끝시는 걸쳐있는경우
      a = classroom_day_filtered.where("class_begin <= ?", time_begin_wanted).where("class_end > ? AND class_end <= ? ", time_begin_wanted, time_end_wanted)
      # 2. 수업의 시작시가 원하는 시간보다 더 빠르지만 끝시는 나가있는경우
      b = classroom_day_filtered.where("class_begin <= ?  AND class_end >= ? ", time_begin_wanted, time_end_wanted)
      # 3. 수업의 시작시가 원하는 시간보다 후, 끝시가 원하는 끝시보다 안
      c = classroom_day_filtered.where("class_begin >= ? AND class_begin < ? ", time_begin_wanted, time_end_wanted).where("class_end <= ?", time_end_wanted)
      # 4. 수업의 시작시가 원하는 시간보다 후, 끝시는 원하는 시간보다 더 느림
      d = classroom_day_filtered.where("class_begin >= ? AND class_begin < ? ", time_begin_wanted, time_end_wanted).where("class_end >= ?", time_end_wanted)
      
      e = a.pluck(:class_room) + b.pluck(:class_room) + c.pluck(:class_room) + d.pluck(:class_room)
      # @aa = a.pluck(:class_room)
      # @bb = b.pluck(:class_room)
      # @cc = c.pluck(:class_room)
      # @dd = d.pluck(:class_room)
      @f = e.uniq
      @classrooms = classroom_building_filter.pluck(:class_room).uniq
      
      @final_result = (@classrooms - @f).sort
      @time_begin_wanted = params[:begin]
      @time_end_wanted = params[:end]
      unless @final_result.present?
          
        redirect_to "/home/index" 
        flash[:alert] = "동무 원하시는 시간에 가능한 교실이 없다오"
      end
      
    end
    
    

    
    
      
      
    
    
    # Time.at(82800).utc.strftime("%I:%M%p")
  end
end
