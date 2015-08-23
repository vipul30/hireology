class Job < ActiveRecord::Base


    has_many :applications, :class_name => 'Application'

    paginates_per 5

	validates :title, :presence => { :message => "Please enter a title." },
					  :length => { :maximum => 100 }
	validates :location, :presence => { :message => "Please enter the location of the job." },
						 :length => { :maximum => 100 }
	validates :description, :presence => { :message => "Please enter a description." },
						    :length => { :maximum => 500000 }
	


end
