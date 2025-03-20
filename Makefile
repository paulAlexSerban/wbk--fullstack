clean_jupyter_notebooks:
	@echo "Cleaning Jupyter Notebook files..."
	@du -sh ./* | sort -rh | head -n 5
	@find . -name "*.ipynb" -exec nbstripout {} \;
	@du -sh ./* | sort -rh | head -n 5
	@echo "Jupyter Notebook files cleaned."
