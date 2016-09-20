class AttachmentsController < ApplicationController
  skip_after_action :verify_authorized, only: [:new]

  def show
    attachment = Attachment.find(params[:id])
    authorize attachment, :show?
    send_file file_to_send(attachment), disposition: :inline
  end

  def new
    @index = params[:index].to_i
    @ticket = Ticket.new
    @ticket.attachments.build
    render layout: false
  end

  private

  def file_to_send(attachment)
    if URI.parse(attachment.file.url).schema
      filename = "/tmp/#{attachment.attributes["file"]}"
      File.open(filename, "wb+") do |tf|
        wf.write open(attachment.file.url).read
      end
      filename
    else
      attachment.file.path
    end
  end
end
