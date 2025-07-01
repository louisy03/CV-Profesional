FROM ruby:3.2

# Instala dependencias
RUN apt-get update -y && \
    apt-get install -y build-essential nodejs

# Crea directorio de trabajo
WORKDIR /app

# Copia tu app
COPY . .

# Instala gems (como jekyll)
RUN gem install bundler && bundle install

# Genera el sitio estático
RUN bundle exec jekyll build

# Usa nginx o similar para servir el sitio estático (opcional)
# Aquí usaremos `jekyll serve` para desarrollo
EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]
