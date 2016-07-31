require 'rails_helper'

RSpec.describe ProjectPolicy do


  subject { described_class }

  permissions :show? do
    let(:user) { FactoryGirl.create :user }
    let(:project) { FactoryGirl.create :project }

    it "blocks anonymous users" do
      expect(subject).not_to permit(user, project)
    end

    it "allows viewers of the project" do
      assign_role!(user, :viewer, project)
      expect(subject).to permit(user, project)
    end

    it "allows editors of the project" do
      assign_role!(user, :editor, project)
      expect(subject).to permit(user, project)
    end

    it "allows managers of the project" do
      assign_role!(user, :manager, project)
      expect(subject).to permit(user, project)
    end

    it "allows administrators" do
      admin = FactoryGirl.create(:user, :admin)
      expect(subject).to permit(admin, project)
    end

    it "doesn't allow users assigned to other projects" do
      other_project = FactoryGirl.create :project
      assign_role!(user, :manager, other_project)
      expect(subject).not_to permit(user, project)
    end
  end
end
