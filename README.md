# Projeto final BDII

No Mercado do Cuel, a rotina organizada é essencial para manter os produtos disponíveis e garantir o bom atendimento aos clientes.
O sistema de banco de dados foi projetado para registrar e automatizar as principais operações do dia a dia do mercado.

- **Clientes:** cada cliente é identificado por um ID e possui informações como nome, CPF, endereço e telefone.

- **Funcionários:** responsáveis pelo atendimento e registro das vendas, armazenando dados como ID, nome, cargo, telefone e salário.

- **Produtos:** cada produto no estoque é controlado com informações detalhadas como ID, nome, preço, quantidade disponível e data de validade.

- **Vendas (CompraVenda):** toda compra realizada por um cliente com auxílio de um funcionário é registrada no sistema, guardando o ID da venda, cliente, funcionário, data e valor total.

- **Itens da Compra (ItemCompra):** cada venda é composta por um ou mais itens, registrando produto, quantidade adquirida e subtotal.

**O sistema também inclui regras de negócio automatizadas:**

- Ao registrar uma nova venda, o estoque do produto é atualizado automaticamente.
- O sistema não permite cadastrar clientes com CPF duplicado.
- Há rotinas para facilitar o cálculo do subtotal de itens e para aplicar descontos automáticos em compras acima de um valor definido.
- Além disso, há procedimentos para registrar vendas de forma prática e para realizar o reabastecimento do estoque quando necessário.

Assim, o banco de dados do Mercado do Cuel garante que as operações mais importantes sejam controladas de forma simples, confiável e automatizada.
