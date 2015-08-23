class AddAttachmentCoverLetterToApplicants < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.attachment :cover_letter
    end
  end

  def self.down
    remove_attachment :applicants, :cover_letter
  end
end
