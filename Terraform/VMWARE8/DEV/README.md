
# README TERRAFORM PASSO A PASSO

Para usar este Terraform e subir máquinas no ambiente é necessário:


**1)** Após clonar o projeto para a máquina, entrar na pasta \VMWARE8\DEV para execução dos comandos

**2)** Inserir seu usuário/senha do Vsphere no arquivo *main.tf*


## Subindo as máquinas

Para aplicar rode os seguintes comandos no terminal: 
*Obs:* (Os nomes dos módulos são os mesmos das pastas e também estão em main.tf)

```bash
  terraform plan -target="module.NOMEMODULO"
```
```bash
  terraform apply -target="module.NOMEMODULO"
```

**5)** Verificar no VMWARE a correta aplicação das configurações


## Editado por

- [Jéssica Sales](https://github.com/jessicasales)
