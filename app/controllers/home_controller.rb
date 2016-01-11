class HomeController < ApplicationController
  def main
  end
  
  def who
  end
  
  def diary
    @diaries = Diary.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end
  
  def write_diary

  end

  def detail_diary
    @diary = Diary.find(params[:id])
  end
  
  def edit_diary
    diary = Diary.find(params[:id])
    if params[:commit] == "Edit"
      diary.title = params[:title]
      diary.content = params[:content]
      diary.save
    else
      diary.delete
    end
    redirect_to "/home/diary"
    
  end

  def create_diary
    Diary.create(title: params[:title], content: params[:content])
    redirect_to "/home/diary"
  end

  
  def plan
    @meetings = Meeting.all
  end

  def detail_plan
  end
  
  def coding
    @projects = Project.all
    
  end

  def write_coding
    @projects = Project.all
  end

  def detail_coding
    @coding = Coding.find(params[:id])
  end

  def edit_coding
    coding = Coding.find(params[:id])
    if params[:commit] == "Edit"
      coding.title = params[:title]
      coding.content = params[:content]
      coding.save
    else
      coding.delete
    end
    redirect_to "/home/coding"
  end

  def new_project
  end

  def create_new_project
    Project.create(project_name: params[:project_name])
    redirect_to '/home/coding'
  end

  def create_coding
    Coding.create(project_id: params[:project_id].to_i,
                  title: params[:title], 
                  content: params[:content])
    redirect_to "/home/coding"
  end

  def detail_project
    @projects = Project.all
    @project = Project.find(params[:id])
    coding = Coding.where(project_id: @project.id)
    @codings = coding.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def delete_project
    project = Project.find(params[:id])
    coding = Coding.where(project_id: project.id)
    coding.delete_all
    project.delete
    redirect_to '/home/coding'
  end
  
  def picture
    @pictures = Picture.paginate(:page => params[:page], :per_page => 9).order('id DESC')
  end

  def upload_picture
  end

  def write_picture
    picture = Picture.new
    picture.title = params[:title]
    picture.my_image = params[:image_file]
    picture.save
    redirect_to "/home/picture"
  end

  def delete_picture
    picture = Picture.find(params[:id])
    reply = Reply.where(picture_id: picture.id)
    reply.delete_all
    picture.delete
    redirect_to "/home/picture"
  end

  def edit_picture
    @picture = Picture.find(params[:id])
  end

  def update_picture
    picture = Picture.find(params[:id])
    picture.title = params[:title]
    picture.my_image = params[:image_file]
    picture.save
    redirect_to "/home/picture"
  end

  def detail_picture
    @picture = Picture.find(params[:id])
  end

  def send_reply
    Reply.create(picture_id: params[:id],
                user_name: params[:user_name],
                content: params[:msg],
                password: params[:password])
    redirect_to :back
  end

  def delete_reply
    reply = Reply.find(params[:reply_id])
    password = params[:password]
    if reply.password == password || password == "admin"
      reply.delete
    end
    redirect_to :back
  end
end
#http://blog.saltfactory.net/ruby/using-ajax-and-partial-in-rails.html