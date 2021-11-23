ref_em_project = File.read!("emProject.html")
# IO.puts(ref_em_project)

updated_em_project = String.replace(ref_em_project, "../../../../../../", "C:/Nordic/SDK/")

IO.puts(updated_em_project) 