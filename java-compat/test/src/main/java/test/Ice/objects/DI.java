// **********************************************************************
//
// Copyright (c) 2003-present ZeroC, Inc. All rights reserved.
//
// **********************************************************************

package test.Ice.objects;

import test.Ice.objects.Test.D;

public final class DI extends D
{
    @Override
    public void ice_preMarshal()
    {
        preMarshalInvoked = true;
    }

    @Override
    public void ice_postUnmarshal()
    {
        postUnmarshalInvoked = true;
    }
}