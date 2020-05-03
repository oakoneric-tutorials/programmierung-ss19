import os
import io

# here = os.getcwd
here = os.path.dirname(os.path.abspath(__file__))

# settings for final titlepage folder
# path = input('Type the destinations path: ')
filename = input('Type the files name: ')

# prepare filenames and files
tempFilename = 'tempfile'
texExt = '.tex'
pdfExt = '.pdf'

tempTexFile = open(tempTexFilename, 'rw')


# compile .tex file >> .pdf
shellCommandHandout = 'pdflatex -jobname ' + tempFilename + '_handout ' + tempFilename + texExt
os.system(shellCommandHandout)

shellCommandSlides = 'pdflatex ' + tempFilename + texExt
os.system(shellCommandSlides)

# remove temporary files (especially .tex-file)
os.remove(tempFilename + texExt)
os.system(del_tex %cd%)