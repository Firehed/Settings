<?php

declare(strict_types=1);

enum DefaultsTypes: string
{
    case Dictionary = 'dictionary';
    case Boolean = 'boolean';
    case String = 'string';
}

class Defaults
{
    function read(string $domain, string $key)
    {
        $type = $this->readType($domain, $key);
        $value = $this->run('defaults read %s %s', $domain, $key);
        return match ($type) {
            DefaultsTypes::Dictionary => $this->fromDictValue($value),
            DefaultsTypes::Boolean => $this->fromBoolValue($value),
            DefaultsTypes::String => $value,
        };
    }

    private function readType(string $domain, string $key): DefaultsTypes
    {
        $output = $this->run('defaults read-type %s %s', $domain, $key);
        $prefix = 'Type is ';
        assert(str_starts_with($output, $prefix));
        $outType = substr($output, strlen($prefix));
        return DefaultsTypes::from($outType);
    }

    function update(string $domain, string $key, mixed $value)
    {
        $formattedValue = $this->formatValue($value);
        // var_dump($domain, $key, $value, $type);
        $cmd = sprintf('defaults write %s %s %s', $domain, $key, $formattedValue);
        var_dump($cmd);
    }

    private function run(string $cmd, string ...$args): string
    {
        $escapedArgs = array_map(escapeshellarg(...), $args);
        $escapedCommand = sprintf($cmd, ...$escapedArgs);
        exec($escapedCommand, $output, $resultCode);
        if ($resultCode !== 0) {
            throw new \Exception('Command exited nonzero');
        }
        return implode("\n", $output);
    }

    private function formatValue(mixed $value): string
    {
        $type = get_debug_type($value);
        return match ($type) {
            'bool' => $this->formatBool($value),
            'array' => $this->formatArrayOrDict($value),
            'string' => $this->formatString($value),
        };
    }

    private function formatBool(bool $value): string
    {
        return match ($value) {
            true => '-bool true',
            false => '-bool false',
        };
    }

    private function formatArrayOrDict(array $value): string
    {
        // if array_is_list($value)
        $args = ['-dict'];
        foreach ($value as $k => $v) {
            $args[] = $k;
            $args[] = $v;
        }
        return implode(' ', array_map(escapeshellarg(...), $args));
    }

    private function formatString(string $value): string
    {
        return sprintf('-string %s', escapeshellarg($value));
    }

    private function fromBoolValue(string $value): bool
    {
        return match ($value) {
            '0' => false,
            '1' => true,
        };
    }

    private function fromDictValue(string $value): array
    {
        /*
        {
            "Select Next Tab" = "@~\\U2192";
            "Select Previous Tab" = "@~\\U2190";
            "Show Next Tab" = "@~\\U2192";
            "Show Previous Tab" = "@~\\U2190";
        }
         */
        var_dump($value);
        return [];
    }
}


$settings = [
    '.GlobalPreferences' => [
        'NSUserKeyEquivalents' => [
            // cmd-opt-arrow keys
            "Select Next Tab" => "@~\\U2192",
            "Select Previous Tab" => "@~\\U2190",
            "Show Next Tab" => "@~\\U2192",
            "Show Previous Tab" => "@~\\U2190",
        ],
    ],
    'com.apple.Safari' => [
        'IncludeDevelopMenu' => true,
    ],
    'com.googlecode.iterm2' => [
        // TODO: homedir? relative to settings dir?
        'PrefsCustomFolder' => '/Users/firehed/dev/github/firehed/settings/iterm',
    ],
];

$d = new Defaults();
foreach ($settings as $domain => $values) {
    foreach ($values as $key => $value) {
        // update($domain, $key, $value);
        var_dump($d->read($domain, $key));
        var_dump($d->update($domain, $key, $value));
    }
}


