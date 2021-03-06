var log = new Log();

var relativePrefix = function (path) {
    var parts = path.split('/');
    var prefix = '';
    var i;
    var count = parts.length - 3;
    for (i = 0; i < count; i++) {
        prefix += '../';
    }
    return prefix;
};

var tenantedPrefix = function (prefix, domain) {
    if (!domain) {
        return prefix;
    }
    var configs = require('/configs/designer.json');
    return prefix + configs.tenantPrefix.replace(/^\//, '') + '/' + domain + '/';
};

var sandbox = function (context, fn) {
    var carbon = require('carbon');
    var options = {};

    if (context.urlDomain) {
        options.domain = context.urlDomain;
    } else {
        options.domain = String(carbon.server.superTenant.domain);
    }

    if (options.domain === context.userDomain) {
        options.username = context.username;
    }

    options.tenantId = carbon.server.tenantId({
        domain: options.domain
    });
    carbon.server.sandbox(options, fn);
};

var allowed = function (roles, allowed) {
    var hasRole = function (role, roles) {
        var i;
        var length = roles.length;
        for (i = 0; i < length; i++) {
            if (roles[i] == role) {
                return true;
            }
        }
        return false;
    };
    var i;
    var length = allowed.length;
    for (i = 0; i < length; i++) {
        if (hasRole(allowed[i], roles)) {
            return true;
        }
    }
    return false;
};

var context = function (user, domain) {
    var ctx = {
        urlDomain: domain
    };
    if (user) {
        ctx.username = user.username;
        ctx.userDomain = user.domain;
    }
    return ctx;
};

var tenantExists = function (domain) {
    var carbon = require('carbon');
    var tenantId = carbon.server.tenantId({
        domain: domain
    });
    return tenantId !== -1;
};

var currentContext = function () {
    var PrivilegedCarbonContext = Packages.org.wso2.carbon.context.PrivilegedCarbonContext;
    var context = PrivilegedCarbonContext.getThreadLocalCarbonContext();
    var username = context.getUsername();
    return {
        username: username,
        domain: context.getTenantDomain(),
        tenantId: context.getTenantId()
    };
};

var findJag = function (path) {
    var file = new File(path);
    if (file.isExists()) {
        return path;
    }
    path = path.replace(/\/[^\/]*$/ig, '');
    if (!path) {
        return null;
    }
    return findJag(path + '.jag');
};

var handlers = function (name) {
    var handlersDir = '/extensions/handlers/';
    var handlerScript = function (handler, script) {
        return handlersDir + handler + '/' + script;
    };
    var file = new File(handlersDir + name);
    if (!file.isExists() && !file.isDirectory()) {
        return true;
    }
    var args = Array.prototype.slice.call(arguments);
    args.shift();
    var handlers = file.listFiles();
    handlers.forEach(function (file) {
        var script = require(handlerScript(name, file.getName()));
        var handle = script.handle;
        if (!handle) {
            return;
        }
        handle.apply(script, args);
    });
};

var store = function () {
    var config = require('/configs/designer.json');
    var storeType = config.store.type;
    var storePath = '/extensions/stores/' + storeType + '/index.js';
    return require(storePath);
};

var dashboardStyles = function () {
    var config = require('/configs/designer.json');
    var theme = config.theme;
    var path = 'extensions/themes/' + theme + '/css/dashboard.css';
    var file = new File('/' + path);
    return file.isExists() ? path : null;
};

var dashboardScripts = function () {
    var config = require('/configs/designer.json');
    var theme = config.theme;
    var path = 'extensions/themes/' + theme + '/js/dashboard.js';
    var file = new File('/' + path);
    return file.isExists() ? path : null;
};

var portalStyles = function () {
    var config = require('/configs/designer.json');
    var theme = config.theme;
    var path = 'extensions/themes/' + theme + '/css/portal.css';
    var file = new File('/' + path);
    return file.isExists() ? path : null;
};

var portalScripts = function () {
    var config = require('/configs/designer.json');
    var theme = config.theme;
    var path = 'extensions/themes/' + theme + '/js/portal.js';
    var file = new File('/' + path);
    return file.isExists() ? path : null;
};