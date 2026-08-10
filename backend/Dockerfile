FROM python:3.13-slim AS builder
WORKDIR /app
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY pyproject.toml uv.lock ./
RUN uv sync --locked --no-install-project
COPY src ./src
RUN uv sync --locked --no-dev

FROM python:3.13-slim AS runner
WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/src /app/src
ENV PATH="/app/.venv/bin:$PATH"
RUN useradd --create-home appuser
USER appuser
EXPOSE 5000
CMD ["uvicorn" , "backend:main:app" , "--host" , "0.0.0.0" , "--port" , "5000"]