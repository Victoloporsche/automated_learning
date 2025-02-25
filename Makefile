.PHONY: install test lint format clean run help

# Default target when just 'make' is run
help:
	@echo "Available commands:"
	@echo "  make install   - Install dependencies using Poetry"
	@echo "  make test      - Run tests"
	@echo "  make lint      - Run linting checks"
	@echo "  make format    - Format code automatically"
	@echo "  make clean     - Remove temporary files"
	@echo "  make run       - Run the application"
	@echo "  make help      - Show this help message"

install:
	poetry install

test:
	poetry run pytest

lint:
	poetry run flake8 .
	poetry run black --check .
	poetry run isort --check-only --diff .

format:
	poetry run black .
	poetry run isort .

clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type d -name "*.egg-info" -exec rm -r {} +
	find . -type d -name "*.pyc" -exec rm -r {} +
	find . -type d -name "*.pyo" -exec rm -r {} +
	find . -type d -name "*.pyd" -exec rm -r {} +
	find . -type d -name ".pytest_cache" -exec rm -r {} +
	find . -type d -name ".coverage" -exec rm -r {} +
	find . -type d -name "htmlcov" -exec rm -r {} +

run:
	poetry run python main.py