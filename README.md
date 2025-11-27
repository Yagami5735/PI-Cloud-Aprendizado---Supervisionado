# Sistema de Processamento e Predição via Regressão Linear

**Projeto Final — Disciplina: Computação em Nuvem e Aprendizado Supervisionado**  

**Pontifícia Universidade Católica de Campinas (PUC-Campinas)**

## Equipe
Edson Eduardo Ferreira — 23908965 — [edson.ef@puccampinas.edu.br](mailto:edson.ef@puccampinas.edu.br)

Gabriel Batista Chiezo — 23028678 — [gabriel.bc2@puccampinas.edu.br](mailto:gabriel.bc2@puccampinas.edu.br)

Victor Furumoto Puttomatti — 23007606 — [victor.fp5@puccampinas.edu.br](mailto:victor.fp5@puccampinas.edu.br)

Yan Yoshida Luz — 23911118 — [yan.yl@puccampinas.edu.br](mailto:yan.yl@puccampinas.edu.br)

## Descrição Geral
A aplicação desenvolvida consiste em uma plataforma web de treinamento, avaliação e predição de modelos de Machine Learning Linear Regressor diretamente na nuvem, permitindo que qualquer usuário envie seus próprios datasets e realize todo o fluxo de análise sem necessidade de ambientes locais, bibliotecas instaladas ou notebooks de código.

O sistema nasce do problema central: a falta de ferramentas simples e acessíveis que democratizem o uso de IA, facilitando o treinamento e a validação de modelos sem conhecimento avançado de infraestrutura ou configuração. Para isso, a solução automatiza etapas como pré-processamento, divisão de dados, treinamento (via Regressão Linear), validação cruzada, avaliação de métricas e geração de gráficos.

Os principais objetivos do sistema são:

- Permitir o upload dinâmico de datasets (.csv) enviados pelo usuário.
- Automatizar tratamento, transformação e normalização dos dados.
- Realizar o treinamento de modelos supervisionados, com foco inicial em Regressão Linear.
- Exibir métricas de desempenho (R², RMSE) e gráficos gerados automaticamente.
- Possibilitar avaliação com novos dados e predição final.
- Integrar todo o fluxo em um ambiente 100% em nuvem, utilizando Docker, FastAPI, Azure Blob Storage e CI/CD.

O sistema se posiciona como uma ferramenta educacional e prática que integra conceitos de Computação em Nuvem, Aprendizado Supervisionado, Transformação de Dados, Séries Temporais e DevOps, oferecendo uma solução completa e modular para experimentação de modelos de Machine Learning.

## Dataset

O sistema é agnóstico em relação aos dados.
* **Fonte:** Arquivos `.csv` enviados dinamicamente pelo usuário (não fixos).
* **Requisitos:** O arquivo deve conter colunas numéricas para as variáveis independentes e uma coluna alvo. O sistema trata a separação automática.

## Arquitetura da Solução
<img width="877" height="423" alt="image" src="https://github.com/user-attachments/assets/adfcb941-3f12-4616-b998-73dc3a6bc214" />

**Componentes Principais:**
1.  **Cliente:** Interage via aplicação web.
2.  **Interface (Frontend):** HTML/JS servido diretamente pela API.
3.  **Backend (API):** Núcleo lógico em Python/FastAPI rodando no container.
4.  **Blob Storage:** Armazena os CSVs de entrada (criptografados .bin), o modelo (.pkl) e as imagens (plots .png) geradas.
5.  **Azure Container Registry (ACR):** Registro privado onde as imagens Docker versionadas são armazenadas.
6.  **Azure Web App for Containers:** Serviço de hospedagem que executa o contêiner Linux da aplicação.
7.  **GitHub Actions:** Pipeline de CI/CD que orquestra o build e o deploy.

## Demonstração
<img width="796" height="3553" alt="pi-backend-ml azurewebsites net_" src="https://github.com/user-attachments/assets/d54b7f21-7115-4d1e-95ba-2eb610ab8e15" />

Link para vídeo de demo: <a href="https://youtu.be/h56UgE-bfoo" target="_blank">https://youtu.be/h56UgE-bfoo</a>

## Referências
* **Relatório Completo:** [https://docs.google.com/document/d/1UYY2JB9GxEuDJIzdYVgwTwx19W1dUpOO6fSzSuvN8gU/edit?usp=sharing](https://docs.google.com/document/d/1UYY2JB9GxEuDJIzdYVgwTwx19W1dUpOO6fSzSuvN8gU/edit?usp=sharing)
* **FastAPI Documentation:** [https://fastapi.tiangolo.com/](https://fastapi.tiangolo.com/)
* **Scikit-Learn (Linear Models):** [https://scikit-learn.org/stable/modules/linear_model.html](https://scikit-learn.org/stable/modules/linear_model.html)
* **Pandas Documentation:** [https://pandas.pydata.org/docs/](https://pandas.pydata.org/docs/)
* **Matplotlib (Visualization):** [https://matplotlib.org/stable/users/index.html](https://matplotlib.org/stable/users/index.html)
* **Azure Blob Storage:** [https://learn.microsoft.com/en-us/azure/storage/blobs/](https://learn.microsoft.com/en-us/azure/storage/blobs/)
* **Azure Container Registry (ACR):** [https://learn.microsoft.com/en-us/azure/container-registry/](https://learn.microsoft.com/en-us/azure/container-registry/)
* **Azure Web App for Containers:** [https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container](https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container)
* **Docker Documentation:** [https://docs.docker.com/](https://docs.docker.com/)
* **GitHub Actions for Azure:** [https://github.com/Azure/actions](https://github.com/Azure/actions)
* **GitHub Actions Documentation:** [https://docs.github.com/en/actions](https://docs.github.com/en/actions)
