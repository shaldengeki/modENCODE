class TranscriptionFactorsDatatable
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: TranscriptionFactor.count,
      iTotalDisplayRecords: transcription_factors.total_entries,
      aaData: data
    }
  end

private

  def data
    transcription_factors.map do |transcription_factor|
      [
        number_field_tag("transcription_factors_select_list" + "[" + transcription_factor.id.to_s + "]", nil, :min => 0, :step => 1),
        # transcription_factor.id,
        h(transcription_factor.gene_type.name),
        h(transcription_factor.name),
        transcription_factor.aliases.map{|this_alias| this_alias.name}.join(", ")
      ]
    end
  end

  def transcription_factors
    @transcription_factors ||= fetch_transcription_factors
  end

  def fetch_transcription_factors
    transcription_factors = TranscriptionFactor.joins(:gene_type).order("#{sort_column} #{sort_direction}")
    transcription_factors = transcription_factors.page(page).per_page(per_page)
    if params[:sSearch].present?
      transcription_factors = transcription_factors.joins(:gene_type).joins(:aliases).where("UPPER(`transcription_factors`.`name`) like UPPER(:search) or UPPER(`aliases`.`name`) LIKE UPPER(:search) or UPPER(flybase_id) like UPPER(:search) or UPPER(cg_id) like UPPER(:search) or UPPER(refseq_id) like UPPER(:search) or UPPER(entrez_id) like UPPER(:search) or UPPER(hgnc_id) like UPPER(:search) or UPPER(ensembl_id) like UPPER(:search) or UPPER(`gene_types`.`name`) like UPPER(:search)", search: "%#{params[:sSearch]}%")
    end
    transcription_factors
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id `gene_types`.`name` name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end