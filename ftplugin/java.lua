-- Get project name for workspace
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = os.getenv('HOME') .. '/.cache/jdtls/' .. project_name
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local lombok_path = mason_path .. "/lombok.jar"

-- Simplified configuration
local config = {
    -- Basic command to start jdtls
    cmd = {
        'java',
        '-javaagent:' .. lombok_path,
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms4g',
        '-XX:+UseG1GC',
        '-XX:+UseStringDeduplication',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        '-jar', vim.fn.glob(mason_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', mason_path .. '/config_mac',
        '-data', workspace_dir .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    },

    -- Find project root
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml'}, { upward = true })[1]),

    -- Important settings for source navigation
    settings = {
        java = {
            configuration = {
                updateBuildConfiguration = "automatic",
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                }
            },
            contentProvider = { preferred = 'fernflower' },
        }
    },

    -- Enable handling of library sources
    init_options = {
        bundles = {},
        extendedClientCapabilities = {
            classFileContentsSupport = true,
            generateToStringPromptSupport = true,
            hashCodeEqualsPromptSupport = true,
            advancedOrganizeImportsSupport = true,
            advancedExtractRefactoringSupport = true
        }
    }
}

-- Start JDTLS
require('jdtls').start_or_attach(config)
