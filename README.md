# Chest

Chest is a basic templating system written in Jsonnet in order to provide centralized settings for my programs.

## How does it work:
Chest searches for the following files in `~/.config/chest`: 
- `programs.jsonnet`
- `common.jsonnet`
- `specific.jsonnet`

The file `programs.jsonnet` contains the definitions of files to generate, and the location of the templates to use. 
The values substituded can be specified in `common.jsonnet` and `specific.jsonnet`.

After having defined the routes and values, the user can run: 
```
jsonnet apply-values.jsonnet  -c -m .
```

