$pdf_mode = 1;    # Use pdflatex
$bibtex_use = 2;  # Use biber for bibliography management

# Add ./Styles to the TeX search path
ensure_path( 'TEXINPUTS', './Styles//' );

# $out_dir = '.';

# # Define extensions to clean as an array
# @clean_exts = qw(
#     aux bbl bcf blg idx ind lof lot out toc 
#     acn acr alg glg glo gls fls log fdb_latexmk 
#     snm nav vrb xdv run.xml synctex.gz
# );

# # Join the array elements with spaces for the clean_ext variable
# $clean_ext = join(' ', @clean_exts);

# print "Loading latexmkrc configuration...\n";
# print "Clean extensions set to: $clean_ext\n";

# # Enable recursive cleaning
# $recurse = 1;
# print "Recursive cleaning enabled\n";

# # Also set full clean extensions
# $clean_full_ext = $clean_ext;