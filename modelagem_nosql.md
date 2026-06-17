# 7. Modelagem de Dados — NoSQL

## 7.1 MongoDB — Coleção `usuarios`

```json
{
  "_id": 1,
  "nome": "Marcelo Silva",
  "email": "marcelo@email.com",
  "tipoUsuario": "profissional",
  "habilidades": ["JavaScript", "MongoDB"]
}
```

### Explicação dos campos

- `_id`: identificador único do usuário
- `nome`: nome do profissional ou da empresa
- `email`: usado para login
- `tipoUsuario`: define se é "profissional" ou "empresa"
- `habilidades`: competências usadas no algoritmo de match

## 7.2 Redis — Sorted Set

```
recomendacoes:usuario:1
→ { usuario:5: 0.92, usuario:8: 0.87, usuario:3: 0.75 }
```

### Caso de uso

Armazena os perfis recomendados para o usuário 1, ordenados por score de compatibilidade (baseado em habilidades/interesses). O Redis permite recuperar rapidamente os matches com maior pontuação, garantindo a resposta em tempo real necessária para a dinâmica de "swipe" do CLTinder.

## 7.3 Justificativa

- **MongoDB**: o perfil de profissionais e empresas tem campos diferentes entre si e pode evoluir com o tempo (novas habilidades, experiências, vagas). O schema flexível do MongoDB se adapta bem a esse cenário.
- **Redis**: o "match" precisa ser rápido e em tempo real (sessões ativas, ranking de recomendações). Por ser um banco em memória, o Redis garante a velocidade necessária para essa dinâmica.
