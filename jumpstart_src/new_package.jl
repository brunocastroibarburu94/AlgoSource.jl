using PkgTemplates

t = Template(;
                  user="brunocastroibarburu94",
                  authors=["Bruno Castro Ibarburu"],
                  dir="/root/project/",
                  plugins=[
                      License(name="MIT"),
                      Git(),
                      GitHubActions(),
                  ],
              )

t("BrunoCastroIbarburu")