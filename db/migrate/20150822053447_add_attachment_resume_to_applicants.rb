class AddAttachmentResumeToApplicants < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :applicants, :resume
  end
end
