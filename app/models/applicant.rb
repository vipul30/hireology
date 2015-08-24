class Applicant < ActiveRecord::Base


    belongs_to :job, :class_name => 'Job', :foreign_key => :job_id

    has_attached_file :resume, {	
								:path => "files/:id/:style/:basename.:extension",
								:url => "/files/:id/:style/:basename.:extension",
								:default_url => "/images/photo_attachment/missing_thumb.png",
								:storage => :s3,
								:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
								:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
            					:s3_host_name => 's3-us-west-1.amazonaws.com',
            					:bucket => 'changefindr.com',
								:size => { :in => 0..500.kilobytes } }

	has_attached_file :cover_letter, {	
								:path => "files/:id/:style/:basename.:extension",
								:url => "/files/:id/:style/:basename.:extension",
								:default_url => "/images/photo_attachment/missing_thumb.png",
								:storage => :s3,
								:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
								:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
            					:s3_host_name => 's3-us-west-1.amazonaws.com',
            					:bucket => 'changefindr.com',
								:size => { :in => 0..500.kilobytes } }

	validates_attachment_content_type :resume, :content_type =>['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain' ],
                                                       :message => 'Resume files can only be MS WORD or TEXT files.'

    validates_attachment_content_type :cover_letter, :content_type =>['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain' ],
                                                       :message => 'Cover Letter can only be MS WORD or TEXT files'

    validates :resume, :presence => { :message => "Please upload your resume." }

    validates :first_name, :presence => { :message => "Please enter your first name." },
					  :length => { :maximum => 100 }

	validates :last_name, :presence => { :message => "Please enter your last name." },
					  :length => { :maximum => 100 }

	validates :phone_number, :presence => { :message => "Please enter your phone number." },
					  :length => { :maximum => 100 }

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    validates :email, :presence => {:message => "Please enter an email address."}, 
    								:length => { :maximum => 100 },
                                    :format => { with: EMAIL_REGEX, message: "Please enter a valid email address." }

   	def display_text_method
    	"#{self.last_name}.camelize, #{self.first_name}.camelize"
  	end

	                   

end
