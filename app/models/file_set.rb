# Generated by curation_concerns:models:install
class FileSet < ActiveFedora::Base
  include ::CurationConcerns::FileSetBehavior
  include Sufia::FileSetBehavior
  include ManagedByUnit

  self.indexer = FileSetIndexer

  # Eventually will have to be moved to presenter / and solrdocument for speedier results
  def loris_id
    ActiveFedora::Noid.treeify(original_file.id) + '-' + original_file.versions.last.label
  end

  # Override image mime types to include 'application/octet-stream'
  def self.image_mime_types
    super << 'application/octet-stream'
  end

  private

  def set_admin_policy
    self.unit = parent&.unit if parent.present?
    super
  end
end
