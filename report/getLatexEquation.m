function latexMatrix = getLatexMatrix(name, matrix)
    %Returns a LaTeX string usable in my own version of Word.
    %Keeping in mind that this code isn't so general and accurate,
    %it could and should be twicked in case of strange behaviours!
    %
    %Input: name of the matrix to be displayed (written in LaTeX
    %       interpretable form!), the actual matrix
    %Ouput: LaTeX code for writing name = matrix
    
    
    latexMatrix = latex(matrix);
    latexMatrix = append(name, "=", latexMatrix);
    latexMatrix = strrep(latexMatrix, 'array', 'matrix');
    latexMatrix = strrep(latexMatrix, '{ccccc}', '');
    latexMatrix = strrep(latexMatrix, '{cccc}', '');
    latexMatrix = strrep(latexMatrix, '{ccc}', '');
    latexMatrix = strrep(latexMatrix, '{cc}', '');
    
    %These in particular a CUSTOM correction for my notation!!!
    latexMatrix = strrep(latexMatrix, 'Dd', '\dot{d}');
    latexMatrix = strrep(latexMatrix, 'Dtheta', '\dot{\theta}');

end

