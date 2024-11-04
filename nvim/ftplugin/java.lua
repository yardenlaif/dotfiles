local jdtls_config = {
	cmd = { "/home/yarden/utils/jdtls/bin/jdtls", "-data", ".nvim/jdtls" },
	-- root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
	root_dir = "/home/yarden/projects/Simple/a",
	settings = {
		java = {
			symbols = {
				includeSourceMethodDeclarations = true,
			},
            signatureHelp = {enabled = true},
            import = {enabled = true},
            rename = {enabled = true}
		},
	},
}
require("jdtls").start_or_attach(jdtls_config)
