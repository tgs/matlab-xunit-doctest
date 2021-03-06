function testSuite = testContainsRegexp
%testContainsRegexp Unit tests for containsRegexp

%   Steven L. Eddins
%   Copyright 2008 The MathWorks, Inc.

localFunctionHandles = cellfun(@str2func, ...
  which('-subfun', mfilename('fullpath')), 'UniformOutput', false);
testSuite = buildFunctionHandleTestSuite(localFunctionHandles);

function testOneStringContains
assertTrue(xunit.utils.containsRegexp('MATLAB is great', '[A-Z]'));

function testOneStringDoesntContain
assertTrue(~ xunit.utils.containsRegexp('no upper-case letters', '[A-Z]'));

function testCellArray
strs = {'MATLAB is great', 'no upper-case letters'};
assertEqual(xunit.utils.containsRegexp(strs, '[A-Z]'), [true false]);
assertEqual(xunit.utils.containsRegexp(strs', '[A-Z]'), [true; false]);